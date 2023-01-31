-module(openapi_authentication_api).

-export([dev_login/2, dev_login/3,
         elements_login_as/2, elements_login_as/3,
         login/1, login/2,
         login_elements/2, login_elements/3,
         logout_get/1, logout_get/2,
         logout_post/1, logout_post/2,
         me/1, me/2,
         switch_organization/2, switch_organization/3]).

-define(BASE_URL, <<"">>).

%% @doc (DEV MODE) Login
%% The dev-login endpoints allows a developer inside permit.io to log in with an email address.  THIS IS ONLY AVAILABLE IN DEV MODE.
-spec dev_login(ctx:ctx(), openapi_dev_login:openapi_dev_login()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
dev_login(Ctx, OpenapiDevLogin) ->
    dev_login(Ctx, OpenapiDevLogin, #{}).

-spec dev_login(ctx:ctx(), openapi_dev_login:openapi_dev_login(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
dev_login(Ctx, OpenapiDevLogin, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/auth/devlogin">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiDevLogin,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Elements Login As
%% 
-spec elements_login_as(ctx:ctx(), openapi_user_login_request_input:openapi_user_login_request_input()) -> {ok, openapi_embedded_login_request_output:openapi_embedded_login_request_output(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
elements_login_as(Ctx, OpenapiUserLoginRequestInput) ->
    elements_login_as(Ctx, OpenapiUserLoginRequestInput, #{}).

-spec elements_login_as(ctx:ctx(), openapi_user_login_request_input:openapi_user_login_request_input(), maps:map()) -> {ok, openapi_embedded_login_request_output:openapi_embedded_login_request_output(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
elements_login_as(Ctx, OpenapiUserLoginRequestInput, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/auth/elements_login_as">>],
    QS = [],
    Headers = [],
    Body1 = OpenapiUserLoginRequestInput,
    ContentTypeHeader = openapi_utils:select_header_content_type([<<"application/json">>]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Login
%% The login endpoint allows the frontend app to exchange a user JWT with a user session. The user session is stored on an httpOnly + secure cookie.
-spec login(ctx:ctx()) -> {ok, openapi_login_result:openapi_login_result(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
login(Ctx) ->
    login(Ctx, #{}).

-spec login(ctx:ctx(), maps:map()) -> {ok, openapi_login_result:openapi_login_result(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
login(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/auth/login">>],
    QS = lists:flatten([])++openapi_utils:optional_params(['invite_code'], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Login Elements
%% The login endpoint allows the frontend app to exchange a user JWT with a user session. The user session is stored on an httpOnly + secure cookie.
-spec login_elements(ctx:ctx(), binary()) -> {ok, openapi_login_result:openapi_login_result(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
login_elements(Ctx, Token) ->
    login_elements(Ctx, Token, #{}).

-spec login_elements(ctx:ctx(), binary(), maps:map()) -> {ok, openapi_login_result:openapi_login_result(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
login_elements(Ctx, Token, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/auth/login_elements">>],
    QS = lists:flatten([{<<"token">>, Token}])++openapi_utils:optional_params([], _OptionalParams),
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Logout Get
%% The logout endpoint deletes the session cookie of a logged in user and invalidates cached VCs.
-spec logout_get(ctx:ctx()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
logout_get(Ctx) ->
    logout_get(Ctx, #{}).

-spec logout_get(ctx:ctx(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
logout_get(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/auth/logout">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Logout Post
%% The logout endpoint deletes the session cookie of a logged in user and invalidates cached VCs.
-spec logout_post(ctx:ctx()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
logout_post(Ctx) ->
    logout_post(Ctx, #{}).

-spec logout_post(ctx:ctx(), maps:map()) -> {ok, [], openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
logout_post(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/auth/logout">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Me
%% 
-spec me(ctx:ctx()) -> {ok, openapi_authn_me_read:openapi_authn_me_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
me(Ctx) ->
    me(Ctx, #{}).

-spec me(ctx:ctx(), maps:map()) -> {ok, openapi_authn_me_read:openapi_authn_me_read(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
me(Ctx, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = get,
    Path = [<<"/v2/auth/me">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).

%% @doc Switch Organization
%% Allows the user to switch his active organization (manipulates the user's login session).  This route will return a new login cookie to the user.
-spec switch_organization(ctx:ctx(), openapi_u_uid:openapi_u_uid()) -> {ok, openapi_login_result:openapi_login_result(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
switch_organization(Ctx, OrgId) ->
    switch_organization(Ctx, OrgId, #{}).

-spec switch_organization(ctx:ctx(), openapi_u_uid:openapi_u_uid(), maps:map()) -> {ok, openapi_login_result:openapi_login_result(), openapi_utils:response_info()} | {ok, hackney:client_ref()} | {error, term(), openapi_utils:response_info()}.
switch_organization(Ctx, OrgId, Optional) ->
    _OptionalParams = maps:get(params, Optional, #{}),
    Cfg = maps:get(cfg, Optional, application:get_env(kuberl, config, #{})),

    Method = post,
    Path = [<<"/v2/auth/switch_org/", OrgId, "">>],
    QS = [],
    Headers = [],
    Body1 = [],
    ContentTypeHeader = openapi_utils:select_header_content_type([]),
    Opts = maps:get(hackney_opts, Optional, []),

    openapi_utils:request(Ctx, Method, [?BASE_URL, Path], QS, ContentTypeHeader++Headers, Body1, Opts, Cfg).


