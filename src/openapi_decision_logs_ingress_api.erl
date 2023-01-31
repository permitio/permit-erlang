-module(openapi_decision_logs_ingress_api).

-export([insert_opa_decision_logs/2, insert_opa_decision_logs/3]).

-define(BASE_URL, <<"">>).

%% @doc OPA Decision Logs Ingress
%% This ingress endpoint captures OPA decision logs.
-spec insert_opa_decision_logs(ctx:ctx(), list()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
insert_opa_decision_logs(Ctx, RequestBody) ->
    insert_opa_decision_logs(Ctx, RequestBody, #{}).

-spec insert_opa_decision_logs(ctx:ctx(), list(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
insert_opa_decision_logs(Ctx, RequestBody, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/decision-logs/ingress">>],
    QS = [],
    Headers = [],
    Body1 = RequestBody,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


