-module(openapi_condition_sets_api).

-export([create_condition_set/4, create_condition_set/5,
         delete_condition_set/4, delete_condition_set/5,
         get_condition_set/4, get_condition_set/5,
         list_condition_sets/3, list_condition_sets/4,
         update_condition_set/5, update_condition_set/6]).

-define(BASE_URL, <<"">>).

%% @doc Create Condition Set
%% Creates a new condition set (can be either a user set or a resource set).
-spec create_condition_set(ctx:ctx(), binary(), binary(), openapi_condition_set_create:openapi_condition_set_create()) -> {ok, openapi_condition_set_read:openapi_condition_set_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_condition_set(Ctx, ProjId, EnvId, OpenapiConditionSetCreate) ->
    create_condition_set(Ctx, ProjId, EnvId, OpenapiConditionSetCreate, #{}).

-spec create_condition_set(ctx:ctx(), binary(), binary(), openapi_condition_set_create:openapi_condition_set_create(), maps:map()) -> {ok, openapi_condition_set_read:openapi_condition_set_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
create_condition_set(Ctx, ProjId, EnvId, OpenapiConditionSetCreate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/condition_sets">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiConditionSetCreate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Delete Condition Set
%% Deletes a condition set and all its related data. This includes any permissions granted to said condition set (i.e: any matching condition set rules).
-spec delete_condition_set(ctx:ctx(), binary(), binary(), binary()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_condition_set(Ctx, ProjId, EnvId, ConditionSetId) ->
    delete_condition_set(Ctx, ProjId, EnvId, ConditionSetId, #{}).

-spec delete_condition_set(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
delete_condition_set(Ctx, ProjId, EnvId, ConditionSetId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = delete,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/condition_sets/", ConditionSetId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Condition Set
%% Gets a single condition set, if such condition set exists.
-spec get_condition_set(ctx:ctx(), binary(), binary(), binary()) -> {ok, openapi_condition_set_read:openapi_condition_set_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_condition_set(Ctx, ProjId, EnvId, ConditionSetId) ->
    get_condition_set(Ctx, ProjId, EnvId, ConditionSetId, #{}).

-spec get_condition_set(ctx:ctx(), binary(), binary(), binary(), maps:map()) -> {ok, openapi_condition_set_read:openapi_condition_set_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_condition_set(Ctx, ProjId, EnvId, ConditionSetId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/condition_sets/", ConditionSetId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc List Condition Sets
%% Lists all condition sets matching a filter.
-spec list_condition_sets(ctx:ctx(), binary(), binary()) -> {ok, [openapi_condition_set_read:openapi_condition_set_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_condition_sets(Ctx, ProjId, EnvId) ->
    list_condition_sets(Ctx, ProjId, EnvId, #{}).

-spec list_condition_sets(ctx:ctx(), binary(), binary(), maps:map()) -> {ok, [openapi_condition_set_read:openapi_condition_set_read()], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
list_condition_sets(Ctx, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/condition_sets">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['type', 'page', 'per_page'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Update Condition Set
%% Partially updates a condition set. Fields that will be provided will be completely overwritten.
-spec update_condition_set(ctx:ctx(), binary(), binary(), binary(), openapi_condition_set_update:openapi_condition_set_update()) -> {ok, openapi_condition_set_read:openapi_condition_set_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_condition_set(Ctx, ProjId, EnvId, ConditionSetId, OpenapiConditionSetUpdate) ->
    update_condition_set(Ctx, ProjId, EnvId, ConditionSetId, OpenapiConditionSetUpdate, #{}).

-spec update_condition_set(ctx:ctx(), binary(), binary(), binary(), openapi_condition_set_update:openapi_condition_set_update(), maps:map()) -> {ok, openapi_condition_set_read:openapi_condition_set_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
update_condition_set(Ctx, ProjId, EnvId, ConditionSetId, OpenapiConditionSetUpdate, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = patch,
    Path = [<<"/v2/schema/", ProjId, "/", EnvId, "/condition_sets/", ConditionSetId, "">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiConditionSetUpdate,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


