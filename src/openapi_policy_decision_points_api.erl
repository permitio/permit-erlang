-module(openapi_policy_decision_points_api).

-export([get_authenticating_pdp_config_values/2, get_authenticating_pdp_config_values/3,
         get_authenticating_pdp_config_values_legacy/1, get_authenticating_pdp_config_values_legacy/2,
         get_pdp_config_values/4, get_pdp_config_values/5,
         list_pdp_configs/3, list_pdp_configs/4,
         rotate_pdp_api_key/4, rotate_pdp_api_key/5]).

-define(BASE_URL, <<"">>).

%% @doc Get connected PDP configuration and push state
%% Gets the configuration values for the currently authenticated PDP container.  The PDP authenticates with an API key scoped to a given Permit.io environment. The system identifies the PDP via its API key and then returns all the configuration values required for the container to run correctly.  The config values returned are considered \"overrides\", meaning they are overriding any default values given to the container by the user.
-spec get_authenticating_pdp_config_values(ctx:ctx(), openapi_pdp_state_update:openapi_pdp_state_update()) -> {ok, openapi_remote_config:openapi_remote_config(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_authenticating_pdp_config_values(Ctx, OpenapiPdpStateUpdate) ->
    get_authenticating_pdp_config_values(Ctx, OpenapiPdpStateUpdate, #{}).

-spec get_authenticating_pdp_config_values(ctx:ctx(), openapi_pdp_state_update:openapi_pdp_state_update(), maps:map()) -> {ok, openapi_remote_config:openapi_remote_config(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_authenticating_pdp_config_values(Ctx, OpenapiPdpStateUpdate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/pdps/me/config">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiPdpStateUpdate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get connected PDP configuration
%% Gets the configuration values for the currently authenticated PDP container.  The PDP authenticates with an API key scoped to a given Permit.io environment. The system identifies the PDP via its API key and then returns all the configuration values required for the container to run correctly.  The config values returned are considered \"overrides\", meaning they are overriding any default values given to the container by the user.
-spec get_authenticating_pdp_config_values_legacy(ctx:ctx()) -> {ok, openapi_remote_config:openapi_remote_config(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_authenticating_pdp_config_values_legacy(Ctx) ->
    get_authenticating_pdp_config_values_legacy(Ctx, #{}).

-spec get_authenticating_pdp_config_values_legacy(ctx:ctx(), maps:map()) -> {ok, openapi_remote_config:openapi_remote_config(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_authenticating_pdp_config_values_legacy(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/pdps/me/config">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get PDP configuration
%% Gets the configuration values for the PDP container with id `pdp_id`.  The config values returned are considered \"overrides\", meaning they are overriding any default values given to the container by the user.
-spec get_pdp_config_values(ctx:ctx(), binary(), binary(), openapi_u_uid:openapi_u_uid()) -> {ok, openapi_remote_config:openapi_remote_config(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_pdp_config_values(Ctx, ProjId, EnvId, PdpId) ->
    get_pdp_config_values(Ctx, ProjId, EnvId, PdpId, #{}).

-spec get_pdp_config_values(ctx:ctx(), binary(), binary(), openapi_u_uid:openapi_u_uid(), maps:map()) -> {ok, openapi_remote_config:openapi_remote_config(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_pdp_config_values(Ctx, ProjId, EnvId, PdpId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/pdps/", ProjId, "/", EnvId, "/configs/", PdpId, "/values">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List PDP configurations
%% 
-spec list_pdp_configs(ctx:ctx(), binary(), binary()) -> {ok, [openapi_p_dp_config_read:openapi_p_dp_config_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_pdp_configs(Ctx, ProjId, EnvId) ->
    list_pdp_configs(Ctx, ProjId, EnvId, #{}).

-spec list_pdp_configs(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [openapi_p_dp_config_read:openapi_p_dp_config_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_pdp_configs(Ctx, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/pdps/", ProjId, "/", EnvId, "/configs">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Rotate PDP API Key
%% Rotates the API key of the PDP container with id `pdp_id`.  The rotation of the API key revokes the old API key and issues a new API key to the PDP.
-spec rotate_pdp_api_key(ctx:ctx(), binary(), binary(), openapi_u_uid:openapi_u_uid()) -> {ok, openapi_p_dp_config_read:openapi_p_dp_config_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
rotate_pdp_api_key(Ctx, ProjId, EnvId, PdpId) ->
    rotate_pdp_api_key(Ctx, ProjId, EnvId, PdpId, #{}).

-spec rotate_pdp_api_key(ctx:ctx(), binary(), binary(), openapi_u_uid:openapi_u_uid(), maps:map()) -> {ok, openapi_p_dp_config_read:openapi_p_dp_config_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
rotate_pdp_api_key(Ctx, ProjId, EnvId, PdpId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/pdps/", ProjId, "/", EnvId, "/configs/", PdpId, "/rotate-api-key">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


