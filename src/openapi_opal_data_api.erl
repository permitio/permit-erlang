-module(openapi_opal_data_api).

-export([get_all_data/4, get_all_data/5,
         get_data_for_role/5, get_data_for_role/6,
         get_data_for_set_rule/6, get_data_for_set_rule/7,
         get_data_for_user/5, get_data_for_user/6]).

-define(BASE_URL, <<"">>).

%% @doc Get All Data
%% 
-spec get_all_data(ctx:ctx(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid()) -> {ok, openapi_full_data:openapi_full_data(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_all_data(Ctx, OrgId, ProjId, EnvId) ->
    get_all_data(Ctx, OrgId, ProjId, EnvId, #{}).

-spec get_all_data(ctx:ctx(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), maps:map()) -> {ok, openapi_full_data:openapi_full_data(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_all_data(Ctx, OrgId, ProjId, EnvId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/internal/opal_data/", OrgId, "/", ProjId, "/", EnvId, "">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['__internal_update_cache'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Data For Role
%% 
-spec get_data_for_role(ctx:ctx(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid()) -> {ok, openapi_role_data:openapi_role_data(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_data_for_role(Ctx, OrgId, ProjId, EnvId, RoleId) ->
    get_data_for_role(Ctx, OrgId, ProjId, EnvId, RoleId, #{}).

-spec get_data_for_role(ctx:ctx(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), maps:map()) -> {ok, openapi_role_data:openapi_role_data(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_data_for_role(Ctx, OrgId, ProjId, EnvId, RoleId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/internal/opal_data/", OrgId, "/", ProjId, "/", EnvId, "/roles/", RoleId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Data For Set Rule
%% return permission assignment data between user sets and resource sets (i.e: condition set rules data)
-spec get_data_for_set_rule(ctx:ctx(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid()) -> {ok, maps:map(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_data_for_set_rule(Ctx, OrgId, ProjId, EnvId, UserSetId, ResourceSetId) ->
    get_data_for_set_rule(Ctx, OrgId, ProjId, EnvId, UserSetId, ResourceSetId, #{}).

-spec get_data_for_set_rule(ctx:ctx(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), maps:map()) -> {ok, maps:map(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_data_for_set_rule(Ctx, OrgId, ProjId, EnvId, UserSetId, ResourceSetId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/internal/opal_data/", OrgId, "/", ProjId, "/", EnvId, "/condition_set_rules/", UserSetId, "/", ResourceSetId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Get Data For User
%% 
-spec get_data_for_user(ctx:ctx(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid()) -> {ok, openapi_user_data:openapi_user_data(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_data_for_user(Ctx, OrgId, ProjId, EnvId, UserId) ->
    get_data_for_user(Ctx, OrgId, ProjId, EnvId, UserId, #{}).

-spec get_data_for_user(ctx:ctx(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), openapi_u_uid:openapi_u_uid(), maps:map()) -> {ok, openapi_user_data:openapi_user_data(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
get_data_for_user(Ctx, OrgId, ProjId, EnvId, UserId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/internal/opal_data/", OrgId, "/", ProjId, "/", EnvId, "/users/", UserId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


