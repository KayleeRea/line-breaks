require 'break_lines'

describe LineBreaker do

  let(:lines) {
    <<LINES
Jean shorts you probably haven't heard of them farm-to-table.

Another line.
LINES
  }

  let(:expected) {
    <<EXPECT.chomp
Jean shorts you
probably haven't
heard of them
farm-to-table.

Another line.
EXPECT
  }

  subject { LineBreaker.new(20) }

  it 'will break lines at 20 a 20 character maximum' do
    expect(subject.split_lines(lines)).to eq(expected)
  end

  describe '#split_line' do
    it 'does nothing to a line of 20 characters or less' do
      subject.split_line('0123456789 123456789').should eq(
        '0123456789 123456789'
      )
    end

    it 'splits a line longer than 20 characters at first space' do
      subject.split_line('0123456789 1234567890').should eq(
        "0123456789\n1234567890"
      )
    end
  end

end