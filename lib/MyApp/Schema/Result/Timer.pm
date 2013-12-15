package MyApp::Schema::Result::Timer;

use DBIx::Class::Candy 
    -autotable => v1,
    -components => ['InflateColumn::DateTime'] ;

primary_column id => {
  data_type => 'int',
  is_auto_increment => 1,
};
 
column name => {
  data_type => 'varchar',
  size => 25,
  is_nullable => 1,
};

column duration_minutes => {
  data_type => 'int',
  is_nullable => 0,
};

column date_started => {
  data_type => 'datetime',
  is_nullable => 0,
};
column date_completed => {
  data_type => 'datetime',
  is_nullable => 1,
};

1;
