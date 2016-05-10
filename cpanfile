requires 'perl', '5.008005';
requires 'String::CamelCase';

on test => sub {
    requires 'Test::Most';
    requires 'Test::Pod';
    requires 'Test::Pod::Coverage', '1.04';
    requires 'Test::EOL';
};
