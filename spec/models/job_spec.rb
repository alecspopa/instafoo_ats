require 'rails_helper'

RSpec.describe Job, type: :model do
  describe "creation" do
    context "with valid attributes" do
      let(:title) { "Sales person" }
      let(:description) { "In charge of sales and growth" }

      it "creates a job successfully" do
        expect { described_class.create(title: title, description: description) }.to change { described_class.count }.by(1)

        last_record = described_class.last
        expect(last_record).to be_present
        expect(last_record.title).to eq(title)
        expect(last_record.description).to eq(description)
      end
    end

    context "with invalid attributes" do
      context "when title is missing" do
        let(:title) { nil }
        let(:description) { "In charge of sales and growth" }

        it "does not create a job" do
          expect { described_class.create(title: title, description: description) }.not_to change { described_class.count }
        end
      end

      context "when description is missing" do
        let(:title) { "Sales person" }
        let(:description) { nil }

        it "does not create a job" do
          expect { described_class.create(title: title, description: description) }.not_to change { described_class.count }
        end
      end
    end
  end
end
