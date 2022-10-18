﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1.NotificationGUI
{
    public partial class DeleteCTMH : Form
    {
        public DeleteCTMH()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            DAO.AdvanceSetting avs = new DAO.AdvanceSetting();
            avs.DeleteCTMH();
            this.Close(); 
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
