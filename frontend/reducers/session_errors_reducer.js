import {RECEIVE_SESSION_ERRORS} from '../actions/session_actions';
import {CLEAR_ERRORS} from '../actions/session_actions';

export default (state = [], action) => {
    Object.freeze(state)
    switch (action.type) {
        case RECEIVE_SESSION_ERRORS:
            return action.errors
        case CLEAR_ERRORS:
            return [];
        default:
            return state  
    }
}