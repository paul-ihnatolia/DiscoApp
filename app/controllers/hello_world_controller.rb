class HelloWorldController < ApplicationController
  def index
    @hello_world_props = { name: "Stranger" }
    render component: 'Admin', props: {}, tag: 'span', class: 'todo'
  end
end
