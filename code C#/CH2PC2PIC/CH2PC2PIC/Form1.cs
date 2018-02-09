using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.IO.Ports;

namespace CH2PC2PIC
{
    public partial class Form1 : Form
    {

        SerialPort port = new SerialPort("COM1", 9600, Parity.None, 8, StopBits.One);

        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }


        // Yellow Button
        private void button1_Click(object sender, EventArgs e)
        { 
            port.Open();
            port.Write("Y");
            port.Close();
        }

        // Red Button
        private void button2_Click(object sender, EventArgs e)
        { 
            port.Open();
            port.Write("R");
            port.Close();
        }

        // LCD Button
        private void button3_Click(object sender, EventArgs e)
        { 
            port.Open();
            port.Write("L");
            port.Close();
        }
    }
}
