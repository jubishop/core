require_relative '../lib/proc'

RSpec.describe(Proc) {
  it('executes a block like normal') {
    count = 1
    proc = proc { count += 1 }
    proc.run
    expect(count).to(eq(2))
  }

  it('executes a block that returns without a problem') {
    proc = proc { return 3 }
    count = proc.run
    expect(count).to(eq(3))
  }
}
