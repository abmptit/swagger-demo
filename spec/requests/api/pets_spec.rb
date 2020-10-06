require 'swagger_helper'

RSpec.describe 'api/pets', type: :request do
    path "/api/v1/pets" do
        post "Create a pet" do
          tags "pets"
          consumes "application/json"
          parameter name: :encounter, in: :body, schema: {
            type: :object,
            properties: {
              patient_id: { type: :integer },
              provider_id: { type: :integer },
            },
            required: ["pet_id"],
          }
    response "201", "pet created" do
            let(:encounter) { { patient_id: 10, provider_id: 1 } }
            run_test!
          end
    response "422", "invalid request" do
            let(:encounter) { { patient_id: 10 } }
            run_test!
          end
        end
      end
end
