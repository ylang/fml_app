  require 'spec_helper'

  describe Message do

    before do
      @message = Message.new(title: 'foo', content: 'foobar2000', challenge_question: 'zig', answer: 'zag')
    end

    subject { @message }

    # test columns
    it { should respond_to(:title) }
    it { should respond_to(:content) }
    it { should respond_to(:challenge_question) }
    it { should respond_to(:answer) }

    it { should be_valid }

    describe "when title is not present" do
      before { @message.title = " " }
      it { should_not be_valid }
    end

    describe "when content is not present" do
      before { @message.content = " " }
      it { should_not be_valid }
    end

    describe "when question is not present" do
      before { @message.challenge_question = " " }
      it { should_not be_valid }
    end

    describe "when answer is not present" do
      before { @message.andswer = " " }
      it { should_not be_valid }
    end


  end