require 'array'

RSpec.describe(Array, '#sentence') {
  context('with just one entry in the list') {
    it('returns the entry alone') {
      expect(['one'].sentence).to(eq('one'))
      expect([123].sentence).to(eq('123'))
    }

    it('ignores any joiner if given') {
      expect(['one'].sentence('ignored')).to(eq('one'))
      expect([123].sentence('ignored')).to(eq('123'))
    }

    it('uses a map block if given') {
      expect(['one'].sentence(&:upcase)).to(eq('ONE'))
      expect([123].sentence(&:even?)).to(eq('false'))
    }

    it('ignores any joiner and uses a map block if given') {
      expect(['one'].sentence('ignored', &:upcase)).to(eq('ONE'))
      expect([123].sentence('ignored', &:even?)).to(eq('false'))
    }
  }

  context('with two entries in the list') {
    it('joins with an `and` by default') {
      expect(%w[one two].sentence).to(eq('one and two'))
      expect([12, 23].sentence).to(eq('12 and 23'))
      expect([12, 'four'].sentence).to(eq('12 and four'))
    }

    it('uses a joiner if given') {
      expect(%w[one two].sentence('or')).to(eq('one or two'))
      expect([12, 23].sentence('plus')).to(eq('12 plus 23'))
      expect([12, 'four'].sentence('nor')).to(eq('12 nor four'))
    }

    it('uses a map block if given') {
      expect(%w[one two].sentence(&:length)).to(eq('3 and 3'))
      expect([12, 23].sentence(&:even?)).to(eq('true and false'))
      expect([12, 'four'].sentence { |x| "#{x}yo" }).to(eq('12yo and fouryo'))
    }

    it('uses a joiner and map block if given') {
      expect(%w[one two].sentence('or', &:length)).to(eq('3 or 3'))
      expect([12, 23].sentence('plus', &:even?)).to(eq('true plus false'))
    }
  }

  context('with more than two entries in the list') {
    it('joins with commas, then `and` by default') {
      expect(%w[one two three].sentence).to(eq('one, two and three'))
      expect([12, 23, 34].sentence).to(eq('12, 23 and 34'))
      expect([12, 'four', 'five'].sentence).to(eq('12, four and five'))
    }

    it('uses a joiner if given') {
      expect(%w[one two three].sentence('or')).to(eq('one, two or three'))
      expect([12, 23, 34].sentence('plus')).to(eq('12, 23 plus 34'))
      expect([12, 'four', 'five'].sentence('nor')).to(eq('12, four nor five'))
    }

    it('uses a map block if given') {
      expect(%w[one two three].sentence(&:length)).to(eq('3, 3 and 5'))
      expect([12, 23, 34].sentence(&:even?)).to(eq('true, false and true'))
    }

    it('uses a joiner and map block if given') {
      expect(%w[one two yo].sentence('or', &:length)).to(eq('3, 3 or 2'))
      expect([12, -23, 34].sentence('nor', &:abs)).to(eq('12, 23 nor 34'))
    }
  }
}
