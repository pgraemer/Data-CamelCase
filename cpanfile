requires 'perl', '5.008005';
requires 'String::CamelCase';

on test => sub {
    requires 'Test::Most';
    requires 'Test::Warnings';
    requires 'Test::Perl::Critic';
    requires 'Test::Pod';
    requires 'Test::Pod::Coverage', '1.04';
    requires 'Test::EOL';
};

on develop => sub {
    requires 'Pod::Markdown::Github';
}
