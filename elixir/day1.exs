defmodule SnowCalibration do
  def recover_calibration_values_from_file(file_path) do
    file_path
    |> File.read!() # Read the contents of the file
    |> String.split("\n", trim: true) # Split input into lines
    |> Enum.map(&extract_calibration_value/1) # Process each line
  end

  defp extract_calibration_value(line) do
    # Find the first digit and last digit in the line
    first_digit = Regex.run(~r/\d/, line) |> List.first()
    last_digit = Regex.run(~r/\d(?!.*\d)/, line) |> List.first()

    # Combine them into a two-digit number
    String.to_integer(first_digit <> last_digit)
  end
end

# Example usage:
file_path = "input.txt"
IO.inspect(SnowCalibration.recover_calibration_values_from_file(file_path))
