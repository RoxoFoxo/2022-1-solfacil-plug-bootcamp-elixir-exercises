defmodule HighSchoolSweetheart do
  def first_letter(name) do
    # Please implement the first_letter/1 function
    name
    |> String.trim()
    |> String.first()
  end

  def initial(name) do
    # Please implement the initial/1 function
    (first_letter(name) <> ".")
    |> String.upcase()
  end

  def initials(full_name) do
    # Please implement the initials/1 function
    [first, last] =
      String.split(full_name)
      |> Enum.map(&initial/1)

    first <> " " <> last
  end

  def pair(full_name1, full_name2) do
    #      ******       ******
    #    **      **   **      **
    #  **         ** **         **
    # **            *            **
    # **                         **
    # **     X. X.  +  X. X.     **
    #  **                       **
    #    **                   **
    #      **               **
    #        **           **
    #          **       **
    #            **   **
    #              ***
    #               *

    # Please implement the pair/2 function
    initials1 = initials(full_name1)
    initials2 = initials(full_name2)
    "     ******       ******
   **      **   **      **
 **         ** **         **
**            *            **
**                         **
**     #{initials1}  +  #{initials2}     **
 **                       **
   **                   **
     **               **
       **           **
         **       **
           **   **
             ***
              *
"

    "     ******       ******\n   **      **   **      **\n **         ** **         **\n**            *            **\n**                         **\n**     #{initials1}  +  #{initials2}     **\n **                       **\n   **                   **\n     **               **\n       **           **\n         **       **\n           **   **\n             ***\n              *\n"
  end
end
