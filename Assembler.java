import java.io.*;
import java.util.HashMap;
import java.util.Map;

public class Assembler {
    static final Map<String, String> OPCODES = new HashMap<>();
    static final Map<String, String> REGISTERS = new HashMap<>();
    static String output = "v2.0 raw\n";

    static {
        OPCODES.put("ADD", "000");
        OPCODES.put("ADDI", "000");
        OPCODES.put("AND", "001");
        OPCODES.put("ANDI", "001");
        OPCODES.put("NAND", "010");
        OPCODES.put("NOR", "011");
        OPCODES.put("LD", "100");
        OPCODES.put("ST", "101");
        OPCODES.put("CMP", "110");
        OPCODES.put("JUMP", "111");
        OPCODES.put("JE", "111");
        OPCODES.put("JA", "111");
        OPCODES.put("JB", "111");
        OPCODES.put("JAE", "111");
        OPCODES.put("JBE", "111");

        REGISTERS.put("R0", "0000");
        REGISTERS.put("R1", "0001");
        REGISTERS.put("R2", "0010");
        REGISTERS.put("R3", "0011");
        REGISTERS.put("R4", "0100");
        REGISTERS.put("R5", "0101");
        REGISTERS.put("R6", "0110");
        REGISTERS.put("R7", "0111");
        REGISTERS.put("R8", "1000");
        REGISTERS.put("R9", "1001");
        REGISTERS.put("R10", "1010");
        REGISTERS.put("R11", "1011");
        REGISTERS.put("R12", "1100");
        REGISTERS.put("R13", "1101");
        REGISTERS.put("R14", "1110");
        REGISTERS.put("R15", "1111");
    }

    public static void main(String[] args) {
        readInput();
        writeOutput();
    }

    public static void writeOutput() {
        try {
            File file = new File("output");
            FileWriter fw = new FileWriter(file);
            BufferedWriter writer = new BufferedWriter(fw);
            writer.write(output);
            writer.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.exit(1);
        }
    }

    public static void readInput() {
        File file = new File("input");
        try (BufferedReader br = new BufferedReader(new FileReader(file))) {
            String line;
            // Read each line from the input file
            while ((line = br.readLine()) != null) {
                if (line.isEmpty()) {
                    continue;
                }
                // Remove commas and split the line into tokens
                line = line.replace(",", "");
                String[] tokens = line.split(" ");
                convertInstruction(tokens);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
            System.exit(1);
        }
    }

    public static void convertInstruction(String[] tokens) {
        // Get the opcode and instruction from the first token
        String opcode = OPCODES.get(tokens[0]);
        String instruction = tokens[0];
        // Declare variables for the different parts of the instruction
        String REG, DR, SR, SR1, SR2, OP1, OP2, IMM, ADDR, binaryADDR, binaryInstruction;
        // Process the instruction based on its type
        switch (instruction) {
            case "ADD", "AND", "NAND", "NOR" -> {
                // For these instructions, get the destination register and two source registers
                DR = tokens[1];
                SR1 = tokens[2];
                SR2 = tokens[3];

                // Convert the instruction to binary and add it to the output
                binaryInstruction = opcode + REGISTERS.get(DR) + REGISTERS.get(SR1) + "000" + REGISTERS.get(SR2);
                convertAndAddToOutput(binaryInstruction);
            }
            case "ADDI", "ANDI" -> {
                // For these instructions, get the destination register, source register and immediate value
                DR = tokens[1];
                SR = tokens[2];
                IMM = tokens[3];
                String binaryIMM = Integer.toBinaryString(Integer.parseInt(IMM));
                if (Integer.parseInt(IMM) < -32 || Integer.parseInt(IMM) > 31) {
                    throw new IllegalArgumentException("Immediate value out of range!");
                }
                if (Integer.parseInt(IMM) < 0) {
                    binaryIMM = binaryIMM.substring(binaryIMM.length() - 6);
                } else {
                    binaryIMM = String.format("%06d", Integer.parseInt(binaryIMM));
                }
                binaryInstruction = opcode + REGISTERS.get(DR) + REGISTERS.get(SR) + "1" + binaryIMM;
                convertAndAddToOutput(binaryInstruction);
            }
            case "LD", "ST" -> {
                // For these instructions, get the register and address
                REG = tokens[1];
                ADDR = tokens[2];
                binaryADDR = Integer.toBinaryString(Integer.parseInt(ADDR));
                if (Integer.parseInt(ADDR) > 2047) {
                    throw new IllegalArgumentException("Address out of range!");
                }
                binaryADDR = String.format("%011d", Integer.parseInt(binaryADDR));
                binaryInstruction = opcode + REGISTERS.get(REG) + binaryADDR;
                convertAndAddToOutput(binaryInstruction);
            }
            case "CMP" -> {
                // For this instruction, get the two operands
                OP1 = tokens[1];
                OP2 = tokens[2];
                binaryInstruction = opcode + REGISTERS.get(OP1) + REGISTERS.get(OP2) + "0000000";
                convertAndAddToOutput(binaryInstruction);
            }
            case "JUMP", "JE", "JA", "JB", "JAE", "JBE" -> {
                // For these instructions, get the address
                ADDR = tokens[1];
                binaryADDR = Integer.toBinaryString(Integer.parseInt(ADDR));
                if (Integer.parseInt(ADDR) < 0) {
                    binaryADDR = binaryADDR.substring(binaryADDR.length() - 11);
                } else {
                    binaryADDR = String.format("%011d", Integer.parseInt(binaryADDR));
                }
                if (Integer.parseInt(ADDR) > 2047) {
                    throw new IllegalArgumentException("Address out of range!");
                }
                switch (instruction) {
                    case "JUMP" -> {
                        binaryInstruction = opcode + "0000" + binaryADDR;
                        convertAndAddToOutput(binaryInstruction);
                    }
                    case "JE" -> {
                        binaryInstruction = opcode + "0001" + binaryADDR;
                        convertAndAddToOutput(binaryInstruction);
                    }
                    case "JA" -> {
                        binaryInstruction = opcode + "0010" + binaryADDR;
                        convertAndAddToOutput(binaryInstruction);
                    }
                    case "JB" -> {
                        binaryInstruction = opcode + "0011" + binaryADDR;
                        convertAndAddToOutput(binaryInstruction);
                    }
                    case "JAE" -> {
                        binaryInstruction = opcode + "0100" + binaryADDR;
                        convertAndAddToOutput(binaryInstruction);
                    }
                    case "JBE" -> {
                        binaryInstruction = opcode + "0101" + binaryADDR;
                        convertAndAddToOutput(binaryInstruction);
                    }
                }
            }
            default -> throw new IllegalArgumentException("Invalid instruction: " + instruction);
        }
    }

    public static void convertAndAddToOutput(String binaryInstruction) {
        // Convert the binary instruction to hexadecimal and add it to the output
        String hexInstruction = binaryToHex(binaryInstruction);
        output += hexInstruction + " ";
    }

    public static String binaryToHex(String binaryInstruction) {
        // Check if the binary input length is exactly 18 bits
        if (binaryInstruction.length() != 18) {
            throw new IllegalArgumentException("Input must be an 18-bit binary string");
        }

        int decimalValue = Integer.parseInt(binaryInstruction, 2);
        StringBuilder resultHex = new StringBuilder(Integer.toHexString(decimalValue));
        while (resultHex.length() < 5) {
            resultHex.insert(0, "0");
        }
        return resultHex.toString();
    }
}