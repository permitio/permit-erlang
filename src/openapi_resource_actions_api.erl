-module(openapi_resource_actions_api).

-export([create_resource_action/5, create_resource_action/6,
         delete_resource_action/5, delete_resource_action/6,
         get_resource_action/5, get_resource_action/6,
         list_resource_actions/4, list_resource_actions/5,
         update_resource_action/6, update_resource_action/7]).

-define(BASE_URL, <<"">>).

%% @doc Create Resource Action
%% Creates a new action that can affect the resource.
-spec create_resource_action(ctx:ctx(), binary(), binary(), binary(), openapi_resource_action_create:openapi_resource_action_create()) -> {ok, openapi_resource_action_read:openapi_resource_action_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_resource_action(Ctx, ProjId, EnvId, ResourceId, OpenapiResourceActionCreate) ->
    create_resource_action(Ctx, ProjId, EnvId, ResourceId, OpenapiResourceActionCreate, #{}).

-spec create_resource_action(ctx:ctx(), binary(), binary(), binary(), openapi_resource_action_create:openapi_resource_action_create(), maps:map()) -> {ok, openapi_resource_action_read:openapi_resource_action_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_resource_action(Ctx, ProjId, EnvId, ResourceId, OpenapiResourceActionCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/actions">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiResourceActionCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete Resource Action
%% Deletes the action and all its related data. This includes any permissions granted to perform the action.
-spec delete_resource_action(ctx:ctx(), binary(), binary(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_resource_action(Ctx, ProjId, EnvId, ResourceId, ActionId) ->
    delete_resource_action(Ctx, ProjId, EnvId, ResourceId, ActionId, #{}).

-spec delete_resource_action(ctx:ctx(), binary(), binary(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_resource_action(Ctx, ProjId, EnvId, ResourceId, ActionId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/actions/", ActionId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Resource Action
%% Gets a single action defined on the resource, if such action exists.
-spec get_resource_action(ctx:ctx(), binary(), binary(), binary(), binary()) -> {ok, openapi_resource_action_read:openapi_resource_action_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_resource_action(Ctx, ProjId, EnvId, ResourceId, ActionId) ->
    get_resource_action(Ctx, ProjId, EnvId, ResourceId, ActionId, #{}).

-spec get_resource_action(ctx:ctx(), binary(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_resource_action_read:openapi_resource_action_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_resource_action(Ctx, ProjId, EnvId, ResourceId, ActionId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/actions/", ActionId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Resource Actions
%% Lists all the actions defined on the resource.
-spec list_resource_actions(ctx:ctx(), binary(), binary(), binary()) -> {ok, [openapi_resource_action_read:openapi_resource_action_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_resource_actions(Ctx, ProjId, EnvId, ResourceId) ->
    list_resource_actions(Ctx, ProjId, EnvId, ResourceId, #{}).

-spec list_resource_actions(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, [openapi_resource_action_read:openapi_resource_action_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_resource_actions(Ctx, ProjId, EnvId, ResourceId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/actions">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update Resource Action
%% Partially updates the action defined on a resource. Fields that will be provided will be completely overwritten.
-spec update_resource_action(ctx:ctx(), binary(), binary(), binary(), binary(), openapi_resource_action_update:openapi_resource_action_update()) -> {ok, openapi_resource_action_read:openapi_resource_action_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_resource_action(Ctx, ProjId, EnvId, ResourceId, ActionId, OpenapiResourceActionUpdate) ->
    update_resource_action(Ctx, ProjId, EnvId, ResourceId, ActionId, OpenapiResourceActionUpdate, #{}).

-spec update_resource_action(ctx:ctx(), binary(), binary(), binary(), binary(), openapi_resource_action_update:openapi_resource_action_update(), maps:map()) -> {ok, openapi_resource_action_read:openapi_resource_action_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_resource_action(Ctx, ProjId, EnvId, ResourceId, ActionId, OpenapiResourceActionUpdate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = patch,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/resources/", ResourceId, "/actions/", ActionId, "">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiResourceActionUpdate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


