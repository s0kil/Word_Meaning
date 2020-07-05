component Pages.WordDefinition {
  connect Dictionary exposing { wordDefinitions }

  get words {
    wordDefinitions
    |> Array.reduce(
      [],
      (
        accumulator : Array(String),
        currentValue : WordDefinition
      ) {
        accumulator
        |> Array.push(Array.firstWithDefault("", currentValue.shortDefinition))
      })
    |> Array.select(
      (value : String) { String.size(value) > 0 })
  }

  fun render {
    <ul>
      for (word of words) {
        <li>
          "#{word}"
        </li>
      }
    </ul>
  }
}
