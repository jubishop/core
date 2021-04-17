require 'string'

RSpec.describe(String, '#vowel?') {
  context('with more than one character') {
    it('always returns false') {
      %w[poop aeuoi AEIOUY AE sNth Yy Yo Nope Yep].each { |string|
        expect(string.vowel?).to(be(false))
      }
    }
  }

  context('with just a single vowel') {
    it('always returns true') {
      %w[a e i o u y A E I O U Y].each { |string|
        expect(string.vowel?).to(be(true))
      }
    }
  }

  context('with just a single consonant') {
    it('always returns false') {
      %w[b c D f g h J k l M n p Q r S t v W x z].each { |string|
        expect(string.vowel?).to(be(false))
      }
    }
  }
}
