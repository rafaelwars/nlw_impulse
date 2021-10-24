defmodule NlwTagsWeb.MessagesView do
  use NlwTagsWeb, :view

  def render("create.json", %{message: message}) do
    %{
      result: "Message created!",
      message: message
    }
  end
end
