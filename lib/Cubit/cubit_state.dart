abstract class NewsStates {}

class InitialState extends NewsStates{}

class BottomNav extends NewsStates{}

class GetBusinessLoading extends NewsStates{}

class GetBusinessError extends NewsStates{
  final error;

   GetBusinessError({
     this.error,
  });
}

class GetBusinessSuccess extends NewsStates{}

class GetSportsLoading extends NewsStates{}

class GetSportsError extends NewsStates{
  final error;

  GetSportsError({
    this.error,
  });
}

class GetSportsSuccess extends NewsStates{}

class GetScienceLoading extends NewsStates{}

class GetScienceError extends NewsStates{
  final error;

  GetScienceError({
    this.error,
  });
}

class GetScienceSuccess extends NewsStates{}

class GetSearchLoading extends NewsStates{}

class GetSearchError extends NewsStates{
  final error;

  GetSearchError({
    this.error,
  });
}

class GetSearchSuccess extends NewsStates{}


class DarkTheme extends NewsStates{}