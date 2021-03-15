require 'string'

RSpec.describe(String, '#pluralize') {
  context('with an amount of just one') {
    it('returns the same value') {
      ['poop', 'entry', 'a', 'friday', 'zero', '', 'person'].each { |string|
        expect(string.pluralize(1)).to(eq(string))
      }
    }
  }

  context('with an amount other than one') {
    amounts = [0, 2, 99]

    it('returns custom plurals for special strings') {
      amounts.each { |amount|
        expect('person'.pluralize(amount)).to(eq('people'))
      }
    }

    it('returns the plural with just an `s`') {
      strings = %w[one poop ape friday boo]
      amounts.each { |amount|
        strings.each { |string|
          expect(string.pluralize(amount)).to(eq("#{string}s"))
        }
      }
    }

    it('returns the plural with `es` when ending in o') {
      strings = %w[zero hero labo hetero]
      amounts.each { |amount|
        strings.each { |string|
          expect(string.pluralize(amount)).to(eq("#{string}es"))
        }
      }
    }

    it('returns the plural with `ies` when ending in y') {
      strings = %w[entry crazy]
      amounts.each { |amount|
        strings.each { |string|
          expect(string.pluralize(amount)).to(eq("#{string[...-1]}ies"))
        }
      }
    }
  }
}
