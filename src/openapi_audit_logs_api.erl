-module(openapi_audit_logs_api).

-export([get_detailed_audit_log/4, get_detailed_audit_log/5,
         list_audit_logs/3, list_audit_logs/4]).

-define(BASE_URL, <<"">>).

%% @doc Get detailed audit log
%% 
-spec get_detailed_audit_log(ctx:ctx(), binary(), binary(), openapi_u_uid:openapi_u_uid()) -> {ok, openapi_detailed_audit_log:openapi_detailed_audit_log(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_detailed_audit_log(Ctx, ProjId, EnvId, LogId) ->
    get_detailed_audit_log(Ctx, ProjId, EnvId, LogId, #{}).

-spec get_detailed_audit_log(ctx:ctx(), binary(), binary(), openapi_u_uid:openapi_u_uid(), maps:map()) -> {ok, openapi_detailed_audit_log:openapi_detailed_audit_log(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_detailed_audit_log(Ctx, ProjId, EnvId, LogId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/pdps/", ProjId, "/", EnvId, "/audit_logs/", LogId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Audit Logs
%% 
-spec list_audit_logs(ctx:ctx(), binary(), binary()) -> {ok, openapi_paginated_result_audit_log_:openapi_paginated_result_audit_log_(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_audit_logs(Ctx, ProjId, EnvId) ->
    list_audit_logs(Ctx, ProjId, EnvId, #{}).

-spec list_audit_logs(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openapi_paginated_result_audit_log_:openapi_paginated_result_audit_log_(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_audit_logs(Ctx, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/pdps/", ProjId, "/", EnvId, "/audit_logs">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['pdp_id', 'users', 'decision', 'resources', 'tenant', 'action', 'timestamp_from', 'timestamp_to', 'page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


