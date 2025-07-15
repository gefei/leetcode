pub fn is_valid(word: String) -> bool {
      if word.len() < 3 {return false;}
      let mut has_vowel = false;
      let mut has_conso = false;

      for c in word.chars() {
         if (c < '0' || c > '9') && (c < 'a' || c > 'z') && (c < 'A' || c > 'Z') {return false}
         if c == 'a' || c == 'e' || c == 'i' || c == 'o' || c == 'u' {has_vowel = true}
         if c == 'A' || c == 'E' || c == 'I' || c == 'O' || c == 'U' {has_vowel = true}
         if c >= 'b' && c <= 'z' && c != 'e' && c != 'i' && c != 'o' && c != 'u' {has_conso = true}
         if c >= 'B' && c <= 'Z' && c != 'E' && c != 'I' && c != 'O' && c != 'U' {has_conso = true}
      }
      return has_conso && has_vowel;
}