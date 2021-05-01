require_relative '../lib/enumerable'
require_relative '../lib/hash'

# rubocop:disable Style/StringHashKeys
RSpec.describe('Hash and Enumerable') {
  it('symbolizes keys in place') {
    a = { 'a' => 'b' }
    a.symbolize_keys!
    expect(a).to(eq(a: 'b'))
  }

  it('symbolizes keys but does not change original') {
    a = { 'a' => 'b' }
    b = a.symbolize_keys
    expect(a).to(eq('a' => 'b'))
    expect(b).to(eq(a: 'b'))
  }

  it('deeply transforms keys in place') {
    a = { 'a' => { 'b' => 2 } }
    a.deep_transform_keys!(&:upcase)
    expect(a).to(eq({ 'A' => { 'B' => 2 } }))
  }

  it('deeply symbolizes keys in place') {
    a = { 'a' => { 'b' => 2 } }
    a.deep_symbolize_keys!
    expect(a).to(eq({ a: { b: 2 } }))
  }

  it('deeply transforms keys through arrays') {
    a = { 'a' => [{ 'b' => 2 }] }
    a.deep_transform_keys!(&:upcase)
    expect(a).to(eq({ 'A' => [{ 'B' => 2 }] }))
  }

  it('deeply symbolizes keys through arrays') {
    a = { 'a' => [{ 'b' => 2 }] }
    a.deep_symbolize_keys!
    expect(a).to(eq({ a: [{ b: 2 }] }))
  }
}
# rubocop:enable Style/StringHashKeys
