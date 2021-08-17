require "test_helper"
require "generators/inicio/inicio_generator"

class InicioGeneratorTest < Rails::Generators::TestCase
  tests InicioGenerator
  destination Rails.root.join('tmp/generators')
  setup :prepare_destination

  # test "generator runs without errors" do
  #   assert_nothing_raised do
  #     run_generator ["arguments"]
  #   end
  # end
end
