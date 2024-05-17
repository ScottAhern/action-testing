# Configuration file for the Sphinx documentation builder.
#
# For the full list of built-in configuration values, see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Project information -----------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information

project = "example_project"
copyright = "2024, ScottAhern"
author = "ScottAhern"
release = "1.2.0"

# -- General configuration ---------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration

extensions = [
    "sphinx.ext.autodoc",  # Allows sphinx-apidoc to work
    "sphinx.ext.todo",  # optional.  Allows inline "todo:"
    "sphinx.ext.imgmath",  # optional. Allows LaTeX equations
    "sphinx.ext.napoleon",  # Allows google/numpy docstrings
    "sphinx.ext.githubpages",  # Adds .nojekyll file
]

templates_path = ["_templates"]
exclude_patterns = []


# -- Options for HTML output -------------------------------------------------
# https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

html_theme = "alabaster"
html_static_path = ["_static"]
