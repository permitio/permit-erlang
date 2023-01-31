-module(openapi_policy_api).

-export([get_opal_data_sources/1, get_opal_data_sources/2,
         get_opal_data_sources_opal_data_config_get/1, get_opal_data_sources_opal_data_config_get/2]).

-define(BASE_URL, <<"">>).

%% @doc Get Opal Data Sources
%% 
-spec get_opal_data_sources(ctx:ctx()) -> {ok, openapi_data_source_config:openapi_data_source_config(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_opal_data_sources(Ctx) ->
    get_opal_data_sources(Ctx, #{}).

-spec get_opal_data_sources(ctx:ctx(), maps:map()) -> {ok, openapi_data_source_config:openapi_data_source_config(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_opal_data_sources(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/opal/data/config">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['token'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Opal Data Sources
%% 
-spec get_opal_data_sources_opal_data_config_get(ctx:ctx()) -> {ok, openapi_data_source_config:openapi_data_source_config(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_opal_data_sources_opal_data_config_get(Ctx) ->
    get_opal_data_sources_opal_data_config_get(Ctx, #{}).

-spec get_opal_data_sources_opal_data_config_get(ctx:ctx(), maps:map()) -> {ok, openapi_data_source_config:openapi_data_source_config(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_opal_data_sources_opal_data_config_get(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/opal/data/config">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['token'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


