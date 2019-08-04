require 'game'
require 'support/fake_io'
require 'stringio'

describe Game do

  def simulate_stdin(*inputs, &block)
    io = StringIO.new
    inputs.flatten.each { |str| io.puts(str) }
    io.rewind

    actual_stdin, $stdin = $stdin, io
    yield
  ensure
    $stdin = actual_stdin
  end

  describe '#play' do
    # subject(:game) {
    #   Game.new
    # }

    context 'given a good scenario gameplay' do
      it 'works successfully' do
        game = Game.new(STDIN, STDOUT)

        expect {
          simulate_stdin("exit") { game.play }
        }.to output(" > end of games...").to_stdout


        # stdin = StringIO.new
        # stdin.puts "okeh\n"
        #
        # stdout = StringIO.new
        #
        # game = Game.new(stdin, stdout)

        # allow(game).to receive(:gets).and_return("input1", "input2", "input3")

        # expect(STDOUT).to receive(:puts).with("Input:")
        # expect(STDIN).to receive(:gets) { 'create_parking_lot 3' }


        # game.play

        # game.stub(:gets).and_return("1\n")
        # expect(game.play).to output("Hello world")

        # output = FakeIO.each_input(["line1", "line2", "line3"]) { game.play }
        # output.should == "line1\nline2\nline3\n"


      end

    end

  end

end