In its current state, our workflow uses a greeting hardcoded into the process command. We want to add some flexibility by using an input variable, so that we can more easily change the greeting at runtime.

This requires us to make three sets of changes to our script:

Change the process to expect a variable input
Set up a command-line parameter to capture user input
Pass the input to the process in the workflow body

# Change the sayHello process to expect a variable input
#!/usr/bin/env nextflow

/*
 * Use echo to print 'Hello World!' to a file
 */
process sayHello {
    input:
    val greeting

    output:
    path 'output.txt'

    script:
    """
    echo '${greeting}' > output.txt
    """
}

workflow {

    main:
    // emit a greeting
    sayHello(params.input)

    publish:
    first_output = sayHello.out
}
output {
    first_output {
        path 'hello_world'
        mode 'copy'
    }
}

nextflow run hello-world.nf --input 'Bonjour le monde!'

# You can readily distinguish Nextflow-level parameters from pipeline-level parameters.

# Parameters that apply to a pipeline always take a double hyphen (--).
# Parameters that modify a Nextflow setting, e.g. the -resume feature we used earlier, take a single hyphen (-).

#Use default values for command line parameters
#!/usr/bin/env nextflow

/*
 * Use echo to print 'Hello World!' to a file
 */
process sayHello {
    input:
    val greeting

    output:
    path 'output.txt'

    script:
    """
    echo '${greeting}' > output.txt
    """
}


/*
 * Pipeline parameters
 */
params {
    input: String = 'Holà mundo!'
}

workflow {

    main:
    // emit a greeting
    sayHello(params.input)

    publish:
    first_output = sayHello.out
}
output {
    first_output {
        path 'hello_world'
        mode 'copy'
    }
}

nextflow run hello-world.nf

#Override the default value
nextflow run hello-world.nf --input 'Konnichiwa!'

