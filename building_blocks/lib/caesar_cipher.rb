def caesar(string, rot)
  origin = (('a'..'z').to_a + ('A'..'Z').to_a).join
  cipher = (('a'..'z').to_a.rotate(rot) + ('A'..'Z').to_a.rotate(rot)).join
  string.to_s.tr(origin, cipher)
end
