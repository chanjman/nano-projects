def caesar(string, rot)
  origin = ('a'..'z').to_a.join + ('A'..'Z').to_a.join
  cipher = ('a'..'z').to_a.rotate(rot).join + ('A'..'Z').to_a.rotate(rot).join
  string.tr(origin, cipher)
end