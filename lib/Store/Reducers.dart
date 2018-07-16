import "./State.dart";
import "./Actions.dart";

CounterState reducerCounter(CounterState state, action) {
  if(action is ActionIncrement) {
    return CounterState(counter: state.counter + action.amount);
  }

  return state;
}

