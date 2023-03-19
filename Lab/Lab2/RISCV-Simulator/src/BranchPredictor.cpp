/*
 * Created by He, Hao on 2019-3-25
 */

#include "BranchPredictor.h"
#include "Debug.h"

BranchPredictor::BranchPredictor()
{
  for (int i = 0; i < PRED_BUF_SIZE; ++i)
  {
    this->predbuf[i] = WEAK_TAKEN;
  }
  std::vector<int8_t> tmp(HISTORY_LENGTH + 1);
  this->tableOfPerceptron.resize(HARDWARE_BUDGET * 1024, tmp);
  for (int i = 0; i < (HARDWARE_BUDGET * 1024); i++)
  {
    for (int j = 0; j < (HISTORY_LENGTH + 1); j++)
    {
      this->tableOfPerceptron[i][j] = 0;
    }
  }
  std::vector<int32_t> history(2);
  this->historyTable.resize(HISTORY_LENGTH, history);
  for (int i = 0; i < HISTORY_LENGTH; i++)
  {
    this->historyTable[i][0] = 0; /* History branch */
    this->historyTable[i][1] = 0; /* Used refence */
  }
}

BranchPredictor::~BranchPredictor() {}

bool BranchPredictor::predict(uint32_t pc, uint32_t insttype, int64_t op1, int64_t op2, int64_t offset)
{
  switch (this->strategy)
  {
  case NT:
    return false;
  case AT:
    return true;
  case BTFNT:
  {
    if (offset >= 0)
    {
      return false;
    }
    else
    {
      return true;
    }
  }
  break;
  case BPB:
  {
    PredictorState state = this->predbuf[pc % PRED_BUF_SIZE];
    if (state == STRONG_TAKEN || state == WEAK_TAKEN)
    {
      return true;
    }
    else if (state == STRONG_NOT_TAKEN || state == WEAK_NOT_TAKEN)
    {
      return false;
    }
    else
    {
      dbgprintf("Strange Prediction Buffer!\n");
    }
  }
  break;
  case PERCEPTRON:
  {
    uint32_t hashPC = (pc % (HARDWARE_BUDGET * 1024));

    int32_t output = 0;
    for (int i = 0; i < HISTORY_LENGTH; i++)
    {
      output += this->tableOfPerceptron[hashPC][i] * this->historyTable[i][0];
    }
    output += this->tableOfPerceptron[hashPC][HISTORY_LENGTH];

    if (output > THRESHOLD)
    {
      this->yOut = 1;
    }
    else if (output < -THRESHOLD)
    {
      this->yOut = -1;
    }
    else
    {
      this->yOut = 0;
    }

    if (output < 0)
    {
      return false;
    }
    else
    {
      return true;
    }
  }
  break;
  default:
    dbgprintf("Unknown Branch Perdiction Strategy!\n");
    break;
  }
  return false;
}

void BranchPredictor::update(uint32_t pc, bool branch)
{
  int id = pc % PRED_BUF_SIZE;
  PredictorState state = this->predbuf[id];
  if (branch)
  {
    this->lastRefence++;
    if (this->strategy == PERCEPTRON)
    {
      if (this->yOut != 1)
      {
        uint32_t hashPC = (pc % (HARDWARE_BUDGET * 1024));
        for (int i = 0; i < HISTORY_LENGTH; i++)
        {
          this->tableOfPerceptron[hashPC][i] += this->historyTable[i][0];
        }
        this->tableOfPerceptron[hashPC][HISTORY_LENGTH]++;
      }
    }
    else
    {
      if (state == STRONG_NOT_TAKEN)
      {
        this->predbuf[id] = WEAK_NOT_TAKEN;
      }
      else if (state == WEAK_NOT_TAKEN)
      {
        this->predbuf[id] = WEAK_TAKEN;
      }
      else if (state == WEAK_TAKEN)
      {
        this->predbuf[id] = STRONG_TAKEN;
      } // do nothing if STRONG_TAKEN
    }

    int8_t index = findReplaceIndexOfHistoryTable();
    this->historyTable[index][0] = 1;
    this->historyTable[index][1] = this->lastRefence;
  }
  else
  {
    this->lastRefence++;
    if (this->strategy == PERCEPTRON)
    {
      if (this->yOut != -1)
      {
        uint32_t hashPC = (pc % (HARDWARE_BUDGET * 1024));
        for (int i = 0; i < HISTORY_LENGTH; i++)
        {
          this->tableOfPerceptron[hashPC][i] -= this->historyTable[i][0];
        }
        this->tableOfPerceptron[hashPC][HISTORY_LENGTH]--;
      }
    }
    else
    {
      // not branch
      if (state == STRONG_TAKEN)
      {
        this->predbuf[id] = WEAK_TAKEN;
      }
      else if (state == WEAK_TAKEN)
      {
        this->predbuf[id] = WEAK_NOT_TAKEN;
      }
      else if (state == WEAK_NOT_TAKEN)
      {
        this->predbuf[id] = STRONG_NOT_TAKEN;
      } // do noting if STRONG_NOT_TAKEN
    }

    int8_t index = findReplaceIndexOfHistoryTable();
    this->historyTable[index][0] = -1;
    this->historyTable[index][1] = this->lastRefence;
  }
}

std::string BranchPredictor::strategyName()
{
  switch (this->strategy)
  {
  case NT:
    return "Always Not Taken";
  case AT:
    return "Always Taken";
  case BTFNT:
    return "Back Taken Forward Not Taken";
  case BPB:
    return "Branch Prediction Buffer";
  case PERCEPTRON:
    return "Dynamic Branch Prediction with Perceptron";
  default:
    dbgprintf("Unknown Branch Perdiction Strategy!\n");
    break;
  }
  return "error"; // should not go here
}

int8_t BranchPredictor::findReplaceIndexOfHistoryTable(void)
{
  int32_t minTmp = this->historyTable[0][1];
  int8_t index = 0;
  for (int i = 0; i < HISTORY_LENGTH; i++)
  {
    if (this->historyTable[i][1] < minTmp)
    {
      minTmp = this->historyTable[i][1];
      index = i;
    }
  }

  return index;
}