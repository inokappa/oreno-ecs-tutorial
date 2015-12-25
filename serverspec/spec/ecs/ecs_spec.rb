require 'spec_helper'

describe docker_image('xxxxxxxxxxxxxxxxx.dkr.ecr.us-east-1.amazonaws.com/oreno-docker-repo') do
  it { should exist }
end
