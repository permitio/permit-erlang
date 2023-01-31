-module(openapi_audit_elements_data_api).

-export([elements_list_audit_logs/4, elements_list_audit_logs/5]).

-define(BASE_URL, <<"">>).

%% @doc List audit logs
%% Lists audit logs for for specific elements config (tenant scope)
-spec elements_list_audit_logs(ctx:ctx(), binary(), binary(), binary()) -> {ok, openapi_paginated_result_audit_log_:openapi_paginated_result_audit_log_(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
elements_list_audit_logs(Ctx, ProjId, EnvId, ElementsConfigId) ->
    elements_list_audit_logs(Ctx, ProjId, EnvId, ElementsConfigId, #{}).

-spec elements_list_audit_logs(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_paginated_result_audit_log_:openapi_paginated_result_audit_log_(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
elements_list_audit_logs(Ctx, ProjId, EnvId, ElementsConfigId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/elements/", ProjId, "/", EnvId, "/config/", ElementsConfigId, "/data/audit_logs">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['search', 'page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


