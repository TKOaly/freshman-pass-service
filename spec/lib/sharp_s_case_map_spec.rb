require 'spec_helper'

# GHSA-34m4-m9fh-gqp5: guards the patched Ruby built in the Dockerfile.
RSpec.describe 'Case mapping of the sharp s in single-byte encodings' do
  encodings = %w[
    ISO-8859-1 ISO-8859-2 ISO-8859-3 ISO-8859-4 ISO-8859-9 ISO-8859-10
    ISO-8859-13 ISO-8859-14 ISO-8859-15 ISO-8859-16
    Windows-1250 Windows-1252 Windows-1254 Windows-1257
  ]

  encodings.each do |name|
    it "expands each sharp s to two letters in #{name}" do
      enc = Encoding.find(name)
      (1..64).each do |n|
        s = ("\xDF".b * n).force_encoding(enc)
        expect(s.upcase).to eq('SS' * n)
        expect(s.downcase(:fold)).to eq('ss' * n)
        expect(s.swapcase).to eq('SS' * n)
        expect(s.capitalize).to eq(('Ss' + "\xDF".b * (n - 1)).force_encoding(enc))
        expect(("a".b + "\xDF".b * n).force_encoding(enc).upcase[1..-1]).to eq('SS' * n)
        expect(s.casecmp?(('ss' * n).force_encoding(enc))).to be(true)
      end
    end
  end
end
