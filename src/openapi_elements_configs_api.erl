-module(openapi_elements_configs_api).

-export([create_elements_config/4, create_elements_config/5,
         delete_elements_config/4, delete_elements_config/5,
         get_elements_config/4, get_elements_config/5,
         get_elements_config_runtime/4, get_elements_config_runtime/5,
         get_elements_type_config/4, get_elements_type_config/5,
         list_elements_configs/3, list_elements_configs/4,
         update_elements_config/5, update_elements_config/6,
         update_elements_type_permissions/5, update_elements_type_permissions/6]).

-define(BASE_URL, <<"">>).

%% @doc Create Elements Config
%% Creates a new elements_config under the active organization.
-spec create_elements_config(ctx:ctx(), binary(), binary(), openapi_elements_config_create:openapi_elements_config_create()) -> {ok, openapi_elements_config_read:openapi_elements_config_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_elements_config(Ctx, ProjId, EnvId, OpenapiElementsConfigCreate) ->
    create_elements_config(Ctx, ProjId, EnvId, OpenapiElementsConfigCreate, #{}).

-spec create_elements_config(ctx:ctx(), binary(), binary(), openapi_elements_config_create:openapi_elements_config_create(), maps:map()) -> {ok, openapi_elements_config_read:openapi_elements_config_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_elements_config(Ctx, ProjId, EnvId, OpenapiElementsConfigCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/elements/", ProjId, "/", EnvId, "/config">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiElementsConfigCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete Elements Config
%% Deletes the elements_config and all its related data.
-spec delete_elements_config(ctx:ctx(), binary(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_elements_config(Ctx, ElementsConfigId, ProjId, EnvId) ->
    delete_elements_config(Ctx, ElementsConfigId, ProjId, EnvId, #{}).

-spec delete_elements_config(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_elements_config(Ctx, ElementsConfigId, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/elements/", ProjId, "/", EnvId, "/", ElementsConfigId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Elements Config
%% Gets a single elements_config matching the given elements_config_id, if such elements_config exists.
-spec get_elements_config(ctx:ctx(), binary(), binary(), binary()) -> {ok, openapi_elements_config_read:openapi_elements_config_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_elements_config(Ctx, ProjId, EnvId, ElementsConfigId) ->
    get_elements_config(Ctx, ProjId, EnvId, ElementsConfigId, #{}).

-spec get_elements_config(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_elements_config_read:openapi_elements_config_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_elements_config(Ctx, ProjId, EnvId, ElementsConfigId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/elements/", ProjId, "/", EnvId, "/config/", ElementsConfigId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Elements Config Runtime
%% Gets a single elements_config matching the given elements_config_id, if such elements_config exists.
-spec get_elements_config_runtime(ctx:ctx(), binary(), binary(), binary()) -> {ok, openapi_elements_config_runtime_read:openapi_elements_config_runtime_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_elements_config_runtime(Ctx, ProjId, EnvId, ElementsConfigId) ->
    get_elements_config_runtime(Ctx, ProjId, EnvId, ElementsConfigId, #{}).

-spec get_elements_config_runtime(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_elements_config_runtime_read:openapi_elements_config_runtime_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_elements_config_runtime(Ctx, ProjId, EnvId, ElementsConfigId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/elements/", ProjId, "/", EnvId, "/config/", ElementsConfigId, "/runtime">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Elements Type Config
%% 
-spec get_elements_type_config(ctx:ctx(), binary(), binary(), openapi_elements_type:openapi_elements_type()) -> {ok, openapi_elements_env_type_read:openapi_elements_env_type_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_elements_type_config(Ctx, ProjId, EnvId, ElementType) ->
    get_elements_type_config(Ctx, ProjId, EnvId, ElementType, #{}).

-spec get_elements_type_config(ctx:ctx(), binary(), binary(), openapi_elements_type:openapi_elements_type(), maps:map()) -> {ok, openapi_elements_env_type_read:openapi_elements_env_type_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_elements_type_config(Ctx, ProjId, EnvId, ElementType, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/elements/", ProjId, "/", EnvId, "/", ElementType, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Elements Configs
%% Lists all the elements_configs under the active organization.
-spec list_elements_configs(ctx:ctx(), binary(), binary()) -> {ok, openapi_paginated_result_elements_config_read_:openapi_paginated_result_elements_config_read_(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_elements_configs(Ctx, ProjId, EnvId) ->
    list_elements_configs(Ctx, ProjId, EnvId, #{}).

-spec list_elements_configs(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, openapi_paginated_result_elements_config_read_:openapi_paginated_result_elements_config_read_(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_elements_configs(Ctx, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/elements/", ProjId, "/", EnvId, "/config">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update Elements Config
%% Updates the elements_config.
-spec update_elements_config(ctx:ctx(), binary(), binary(), binary(), openapi_elements_config_update:openapi_elements_config_update()) -> {ok, openapi_elements_config_read:openapi_elements_config_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_elements_config(Ctx, ElementsConfigId, ProjId, EnvId, OpenapiElementsConfigUpdate) ->
    update_elements_config(Ctx, ElementsConfigId, ProjId, EnvId, OpenapiElementsConfigUpdate, #{}).

-spec update_elements_config(ctx:ctx(), binary(), binary(), binary(), openapi_elements_config_update:openapi_elements_config_update(), maps:map()) -> {ok, openapi_elements_config_read:openapi_elements_config_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_elements_config(Ctx, ElementsConfigId, ProjId, EnvId, OpenapiElementsConfigUpdate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = patch,
    Path = [<<"/v2/elements/", ProjId, "/", EnvId, "/config/", ElementsConfigId, "">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiElementsConfigUpdate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update Elements Type Permissions
%% 
-spec update_elements_type_permissions(ctx:ctx(), openapi_elements_type:openapi_elements_type(), binary(), binary(), openapi_elements_env_type_update:openapi_elements_env_type_update()) -> {ok, openapi_elements_env_type_read:openapi_elements_env_type_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_elements_type_permissions(Ctx, ElementType, ProjId, EnvId, OpenapiElementsEnvTypeUpdate) ->
    update_elements_type_permissions(Ctx, ElementType, ProjId, EnvId, OpenapiElementsEnvTypeUpdate, #{}).

-spec update_elements_type_permissions(ctx:ctx(), openapi_elements_type:openapi_elements_type(), binary(), binary(), openapi_elements_env_type_update:openapi_elements_env_type_update(), maps:map()) -> {ok, openapi_elements_env_type_read:openapi_elements_env_type_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_elements_type_permissions(Ctx, ElementType, ProjId, EnvId, OpenapiElementsEnvTypeUpdate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = patch,
    Path = [<<"/v2/elements/", ProjId, "/", EnvId, "/", ElementType, "">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiElementsEnvTypeUpdate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


