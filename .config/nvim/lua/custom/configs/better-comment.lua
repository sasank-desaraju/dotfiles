local options = {
  tags = {
    {
      name = "TODO",
      fg = "white",
      bg = "#0a7aca",
      bold = true,
      virtual_text = "",
    },
    {
      name = "FIXME",
      fg = "white",
      bg = "#ff0000",
      bold = true,
      virtual_text = "",
    },
    {
      name = "BUG",
      fg = "white",
      bg = "#ff0000",
      bold = true,
      virtual_text = "",
    },
    {
      name = "NOTE",
      fg = "white",
      bg = "#ff0000",
      bold = true,
      virtual_text = "",
    },
  }
}

require("better-comment").Setup(options)
