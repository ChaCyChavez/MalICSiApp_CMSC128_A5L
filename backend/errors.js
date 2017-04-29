exports.NOT_LOGGED_IN = {
    response: {
        message: "You must be logged in."
    },
    code: 401
};

exports.NOT_GAME_HEAD_OR_ADMIN = {
    response: {
        message: "You must be an admin or game_head"
    },
    code: 401
};

exports.QUERY_FAILED = {
    response: {
        message: "The request was not fulfilled due to internal server error"
    },
    code: 500
};

exports.NOT_FOUND = {
    response: {
        message: "Requested resource not found",
    },
    code: 404
};