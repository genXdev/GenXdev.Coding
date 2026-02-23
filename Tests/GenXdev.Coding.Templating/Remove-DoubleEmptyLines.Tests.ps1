###############################################################################
Pester\Describe 'Remove-DoubleEmptyLines' {

    Pester\It 'should work as expected' {

        Microsoft.PowerShell.Core\Import-Module GenXdev.Coding -Force

        $inputStr = @"


        protected static DataTable CreatePermissionGroupMembershipsAdminSyncOutDataTable() {


            DataTable dt = new();


            dt.Columns.Add("PermissionGroupId", typeof(System.Guid));

            dt.Columns.Add("CreatedOn", typeof(System.DateTime));

            dt.Columns.Add("Enabled", typeof(System.Boolean));

            dt.Columns.Add("Sequence", typeof(System.Int64));
            dt.Columns.Add("LastModified", typeof(System.DateTime));
            dt.Columns.Add("IsDeleted", typeof(System.Boolean));
            return dt;
        }


        function test() {
            return true;

        }
"@

        $expected = @"

        protected static DataTable CreatePermissionGroupMembershipsAdminSyncOutDataTable() {

            DataTable dt = new();

            dt.Columns.Add("PermissionGroupId", typeof(System.Guid));
            dt.Columns.Add("CreatedOn", typeof(System.DateTime));
            dt.Columns.Add("Enabled", typeof(System.Boolean));
            dt.Columns.Add("Sequence", typeof(System.Int64));
            dt.Columns.Add("LastModified", typeof(System.DateTime));
            dt.Columns.Add("IsDeleted", typeof(System.Boolean));

            return dt;
        }

        function test() {

            return true;
        }
"@

        $result = GenXdev.Coding\Remove-DoubleEmptyLines -code $inputStr -Reformat

        $result | PESTER\Should -BeExactly $expected

    }
}