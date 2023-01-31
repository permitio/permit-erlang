-module(openapi_api_keys_api).

-export([create_api_key/2, create_api_key/3,
         delete_api_key/2, delete_api_key/3,
         get_api_key/2, get_api_key/3,
         get_api_key_scope/1, get_api_key_scope/2,
         get_environment_api_key/3, get_environment_api_key/4,
         list_api_keys/1, list_api_keys/2]).

-define(BASE_URL, <<"">>).

%% @doc Create Api Key
%% Creates a new api_key under the active organization.
-spec create_api_key(ctx:ctx(), openapi_api_key_create:openapi_api_key_create()) -> {ok, openapi_a_pi_key_read:openapi_a_pi_key_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_api_key(Ctx, OpenapiApiKeyCreate) ->
    create_api_key(Ctx, OpenapiApiKeyCreate, #{}).

-spec create_api_key(ctx:ctx(), openapi_api_key_create:openapi_api_key_create(), maps:map()) -> {ok, openapi_a_pi_key_read:openapi_a_pi_key_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_api_key(Ctx, OpenapiApiKeyCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/api-key">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiApiKeyCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete Api Key
%% Deletes the api_key and all its related data.
-spec delete_api_key(ctx:ctx(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_api_key(Ctx, ApiKeyId) ->
    delete_api_key(Ctx, ApiKeyId, #{}).

-spec delete_api_key(ctx:ctx(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_api_key(Ctx, ApiKeyId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/api-key/", ApiKeyId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Api Key
%% Gets a single api_key matching the given api_key_id, if such api_key exists.
-spec get_api_key(ctx:ctx(), binary()) -> {ok, openapi_a_pi_key_read:openapi_a_pi_key_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_api_key(Ctx, ApiKeyId) ->
    get_api_key(Ctx, ApiKeyId, #{}).

-spec get_api_key(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_a_pi_key_read:openapi_a_pi_key_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_api_key(Ctx, ApiKeyId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/api-key/", ApiKeyId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Api Key Scope
%% 
-spec get_api_key_scope(ctx:ctx()) -> {ok, openapi_a_pi_key_scope_read:openapi_a_pi_key_scope_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_api_key_scope(Ctx) ->
    get_api_key_scope(Ctx, #{}).

-spec get_api_key_scope(ctx:ctx(), maps:map()) -> {ok, openapi_a_pi_key_scope_read:openapi_a_pi_key_scope_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_api_key_scope(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/api-key/scope">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Environment Api Key
%% 
-spec get_environment_api_key(ctx:ctx(), binary(), binary()) -> {ok, openapi_a_pi_key_read:openapi_a_pi_key_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_environment_api_key(Ctx, ProjId, EnvId) ->
    get_environment_api_key(Ctx, ProjId, EnvId, #{}).

-spec get_environment_api_key(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openapi_a_pi_key_read:openapi_a_pi_key_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_environment_api_key(Ctx, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/api-key/", ProjId, "/", EnvId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Api Keys
%% Lists all the api_keys under the active organization.
-spec list_api_keys(ctx:ctx()) -> {ok, openapi_paginated_result_api_key_read_:openapi_paginated_result_api_key_read_(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_api_keys(Ctx) ->
    list_api_keys(Ctx, #{}).

-spec list_api_keys(ctx:ctx(), maps:map()) -> {ok, openapi_paginated_result_api_key_read_:openapi_paginated_result_api_key_read_(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_api_keys(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/api-key">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


