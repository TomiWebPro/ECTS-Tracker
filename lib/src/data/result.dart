/// Result wrapper (single home): repositories return errors as values, never
/// throw across layers (AGENTS.md §3).
///
/// Imported directly by repositories, notification prefs, and UI call sites.
/// `repositories.dart` re-exports this file so existing imports keep working.
sealed class Result<T> {
  const Result();
}

class Ok<T> extends Result<T> {
  const Ok(this.value);
  final T value;
}

class Err<T> extends Result<T> {
  const Err(this.message);
  final String message;
}
