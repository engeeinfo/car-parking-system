module park_tb;

    // Inputs
    reg clk;
    reg reset_n;
    reg sensor_entrance;
    reg sensor_exit;
    reg [1:0] password_1;
    reg [1:0] password_2;

    // Outputs
    wire GREEN_LED;
    wire RED_LED;
    wire [6:0] HEX_1;
    wire [6:0] HEX_2;

    // Instantiate the park module
    park uut (
        .clk(clk),
        .reset_n(reset_n),
        .sensor_entrance(sensor_entrance),
        .sensor_exit(sensor_exit),
        .password_1(password_1),
        .password_2(password_2),
        .GREEN_LED(GREEN_LED),
        .RED_LED(RED_LED),
        .HEX_1(HEX_1),
        .HEX_2(HEX_2)
    );

    // Clock generation
    initial begin
        clk = 0;
        forever #10 clk = ~clk; // Generate clock with period of 20 time units
    end

    // Test sequence
    initial begin
        // Initial conditions
        reset_n = 0;
        sensor_entrance = 0;
        sensor_exit = 0;
        password_1 = 0;
        password_2 = 0;

        // Apply reset
        #20 reset_n = 1;  // Deassert reset after 20 time units
        #20 reset_n = 0;  // Assert reset to initialize the system

        // Test Case 1: Simulate entrance sensor activation and password input
        #30 sensor_entrance = 1;  // Entrance sensor activated
        #50 sensor_entrance = 0;  // Entrance sensor deactivated
        #20 password_1 = 2'b01;   // Set password_1 = 01
        #20 password_2 = 2'b10;   // Set password_2 = 10

        // Test Case 2: Wait for password verification and exit sensor activation
        #100 sensor_exit = 1;     // Exit sensor activated (this should take the system to IDLE or STOP state)
        
        // Test Case 3: Wrong password scenario
        #50 password_1 = 2'b11;   // Change to an incorrect password
        #20 password_2 = 2'b00;   // Incorrect password
        #100 sensor_entrance = 1; // Try re-entering with wrong password
        #50 sensor_entrance = 0;

        // Test Case 4: Reset and start again
        #200 reset_n = 0;  // Assert reset
        #20 reset_n = 1;   // Deassert reset
        #20 sensor_entrance = 1; // Re-enter with correct password again
        #50 sensor_entrance = 0;

        // Finish the simulation after the test cases
        #100 $finish;
    end

    // Monitor outputs
    initial begin
        $monitor("At time %t: GREEN_LED = %b, RED_LED = %b, HEX_1 = %b, HEX_2 = %b",
                 $time, GREEN_LED, RED_LED, HEX_1, HEX_2);
    end

endmodule
