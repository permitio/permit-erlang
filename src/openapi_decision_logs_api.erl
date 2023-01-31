-module(openapi_decision_logs_api).

-export([list_pdp_decision_logs/4, list_pdp_decision_logs/5]).

-define(BASE_URL, <<"">>).

%% @doc List PDP Decisions
%% 
-spec list_pdp_decision_logs(ctx:ctx(), binary(), binary(), openapi_u_uid:openapi_u_uid()) -> {ok, openapi_paginated_result_opa_decision_log_:openapi_paginated_result_opa_decision_log_(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_pdp_decision_logs(Ctx, ProjId, EnvId, PdpId) ->
    list_pdp_decision_logs(Ctx, ProjId, EnvId, PdpId, #{}).

-spec list_pdp_decision_logs(ctx:ctx(), binary(), binary(), openapi_u_uid:openapi_u_uid(), maps:map()) -> {ok, openapi_paginated_result_opa_decision_log_:openapi_paginated_result_opa_decision_log_(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_pdp_decision_logs(Ctx, ProjId, EnvId, PdpId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/pdps/", ProjId, "/", EnvId, "/decision-logs/", PdpId, "">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['users', 'approved', 'resources', 'timestamp_from', 'timestamp_to', 'page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


