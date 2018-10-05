module Pages
  module Docs
    class ComponentUsage < Page::Cell::Page

      def prepare
      end

      def response
        components {
          div class: "page-heading" do
            row do
              col desktop: 8, offset: { desktop: 2 } do
                div class: "page-content" do
                  heading size: 2, text: "How to use a basemate Component"
                  # heading size: 5, text: "Welcome to our documentation"
                end
              end
            end
          end
          row do
            col desktop: 8, offset: { desktop: 2 } do
              div class: "page-content" do
                markdown path: "docs/component_usage"
              end
            end
          end
        }
      end

    end
  end
end
