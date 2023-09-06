import choreo/mediation;
import ballerina/log;
import ballerina/http;

listener http:Listener ep0 = new (9090);

service on ep0 {
    resource function get test(http:Caller caller, http:Request request) returns error? {
        map<mediation:PathParamValue> pathParams = {};
        mediation:Context originalCtx = mediation:createImmutableMediationContext("get", ["test"], pathParams, request.getQueryParams());
        mediation:Context mediationCtx = mediation:createMutableMediationContext(originalCtx, ["test"], pathParams, request.getQueryParams());
        http:Response? backendResponse = ();
        do {
            string|error incomingEnvHeader = request.getHeader("X-ENV");
            if (incomingEnvHeader is string && incomingEnvHeader === "sandbox") {
                request.removeHeader("X-ENV");
                backendResponse = check sandboxEP->execute(mediationCtx.httpMethod(), (check mediationCtx.resourcePath().resolve(pathParams)) + buildQuery(mediationCtx.queryParams()), request, targetType = http:Response);
            } else {
                backendResponse = check backendEP->execute(mediationCtx.httpMethod(), (check mediationCtx.resourcePath().resolve(pathParams)) + buildQuery(mediationCtx.queryParams()), request, targetType = http:Response);
            }

            check caller->respond(backendResponse);
        } on fail var e {
            http:Response errFlowResponse = createDefaultErrorResponse(e);
            check caller->respond(errFlowResponse);
        }
    }
    resource function put test(http:Caller caller, http:Request request) returns error? {
        map<mediation:PathParamValue> pathParams = {};
        mediation:Context originalCtx = mediation:createImmutableMediationContext("put", ["test"], pathParams, request.getQueryParams());
        mediation:Context mediationCtx = mediation:createMutableMediationContext(originalCtx, ["test"], pathParams, request.getQueryParams());
        http:Response? backendResponse = ();
        do {
            string|error incomingEnvHeader = request.getHeader("X-ENV");
            if (incomingEnvHeader is string && incomingEnvHeader === "sandbox") {
                request.removeHeader("X-ENV");
                backendResponse = check sandboxEP->execute(mediationCtx.httpMethod(), (check mediationCtx.resourcePath().resolve(pathParams)) + buildQuery(mediationCtx.queryParams()), request, targetType = http:Response);
            } else {
                backendResponse = check backendEP->execute(mediationCtx.httpMethod(), (check mediationCtx.resourcePath().resolve(pathParams)) + buildQuery(mediationCtx.queryParams()), request, targetType = http:Response);
            }

            check caller->respond(backendResponse);
        } on fail var e {
            http:Response errFlowResponse = createDefaultErrorResponse(e);
            check caller->respond(errFlowResponse);
        }
    }
    resource function post test(http:Caller caller, http:Request request) returns error? {
        map<mediation:PathParamValue> pathParams = {};
        mediation:Context originalCtx = mediation:createImmutableMediationContext("post", ["test"], pathParams, request.getQueryParams());
        mediation:Context mediationCtx = mediation:createMutableMediationContext(originalCtx, ["test"], pathParams, request.getQueryParams());
        http:Response? backendResponse = ();
        do {
            string|error incomingEnvHeader = request.getHeader("X-ENV");
            if (incomingEnvHeader is string && incomingEnvHeader === "sandbox") {
                request.removeHeader("X-ENV");
                backendResponse = check sandboxEP->execute(mediationCtx.httpMethod(), (check mediationCtx.resourcePath().resolve(pathParams)) + buildQuery(mediationCtx.queryParams()), request, targetType = http:Response);
            } else {
                backendResponse = check backendEP->execute(mediationCtx.httpMethod(), (check mediationCtx.resourcePath().resolve(pathParams)) + buildQuery(mediationCtx.queryParams()), request, targetType = http:Response);
            }

            check caller->respond(backendResponse);
        } on fail var e {
            http:Response errFlowResponse = createDefaultErrorResponse(e);
            check caller->respond(errFlowResponse);
        }
    }
    resource function delete test(http:Caller caller, http:Request request) returns error? {
        map<mediation:PathParamValue> pathParams = {};
        mediation:Context originalCtx = mediation:createImmutableMediationContext("delete", ["test"], pathParams, request.getQueryParams());
        mediation:Context mediationCtx = mediation:createMutableMediationContext(originalCtx, ["test"], pathParams, request.getQueryParams());
        http:Response? backendResponse = ();
        do {
            string|error incomingEnvHeader = request.getHeader("X-ENV");
            if (incomingEnvHeader is string && incomingEnvHeader === "sandbox") {
                request.removeHeader("X-ENV");
                backendResponse = check sandboxEP->execute(mediationCtx.httpMethod(), (check mediationCtx.resourcePath().resolve(pathParams)) + buildQuery(mediationCtx.queryParams()), request, targetType = http:Response);
            } else {
                backendResponse = check backendEP->execute(mediationCtx.httpMethod(), (check mediationCtx.resourcePath().resolve(pathParams)) + buildQuery(mediationCtx.queryParams()), request, targetType = http:Response);
            }

            check caller->respond(backendResponse);
        } on fail var e {
            http:Response errFlowResponse = createDefaultErrorResponse(e);
            check caller->respond(errFlowResponse);
        }
    }
    resource function patch test(http:Caller caller, http:Request request) returns error? {
        map<mediation:PathParamValue> pathParams = {};
        mediation:Context originalCtx = mediation:createImmutableMediationContext("patch", ["test"], pathParams, request.getQueryParams());
        mediation:Context mediationCtx = mediation:createMutableMediationContext(originalCtx, ["test"], pathParams, request.getQueryParams());
        http:Response? backendResponse = ();
        do {
            string|error incomingEnvHeader = request.getHeader("X-ENV");
            if (incomingEnvHeader is string && incomingEnvHeader === "sandbox") {
                request.removeHeader("X-ENV");
                backendResponse = check sandboxEP->execute(mediationCtx.httpMethod(), (check mediationCtx.resourcePath().resolve(pathParams)) + buildQuery(mediationCtx.queryParams()), request, targetType = http:Response);
            } else {
                backendResponse = check backendEP->execute(mediationCtx.httpMethod(), (check mediationCtx.resourcePath().resolve(pathParams)) + buildQuery(mediationCtx.queryParams()), request, targetType = http:Response);
            }

            check caller->respond(backendResponse);
        } on fail var e {
            http:Response errFlowResponse = createDefaultErrorResponse(e);
            check caller->respond(errFlowResponse);
        }
    }
}

configurable string Endpoint = "https://127.0.0.1:8090/test";
configurable string SandboxEndpoint = "https://127.0.0.1:8090/test";
configurable map<boolean> AdvancedSettings = {};

final http:Client backendEP = check new (Endpoint, config = {secureSocket: {enable: check boolean:fromString("true"), cert: "/home/ballerina/cer.pem", verifyHostName: AdvancedSettings.hasKey("verifyHostname") ? AdvancedSettings.get("verifyHostname") : true}});
final http:Client sandboxEP = check new (SandboxEndpoint, config = {secureSocket: {enable: check boolean:fromString("true"), cert: "/home/ballerina/cer.pem", verifyHostName: AdvancedSettings.hasKey("verifyHostname") ? AdvancedSettings.get("verifyHostname") : true}});

function createDefaultErrorResponse(error err) returns http:Response {
    http:Response resp = new;
    log:printError(err.message(), (), err.stackTrace(), details = err.detail().toString());
    resp.statusCode = http:STATUS_INTERNAL_SERVER_ERROR;
    return resp;
}

function buildQuery(map<string[]> params) returns string {
    if (params.length() == 0) {
        return "";
    }

    string qParamStr = "?";

    foreach [string, string[]] [name, val] in params.entries() {
        foreach string item in val {
            qParamStr += string `${name}=${item}&`;
        }
    }

    return qParamStr.substring(0, qParamStr.length() - 1);
}

function buildRestParamPath(string[] pathSegments) returns string {
    return pathSegments.reduce(
        function(string path, string segment) returns string => string `${path}/${segment}`, "");
}
