# cat_facts
test task with different authorization for different Operating systems 

## Task itself
1) Create project with last stable Flutter and Dart following Clean Architecture principles
2) Implement authentication using Firebase (Apple for iOS/Google for Android)
3) For authenticated user, show the list of cat facts, taken from public API https://catfact.ninja/#/
4) Use BLoC for state management
5) Cover something by test (not everything, something important in your opinion)

## Comments about each part of task
1) was used flutter version 3.7.6
2) for Apple authentication was implemented using email/password. Because I don't have paid Apple developer account.
3) cat facts API supports pagination, but for simplicity I just load 100 cat facts
4) I covered AuthorizationBloc with small test

### P.S.
Approximately 24 cat skins can make a coat