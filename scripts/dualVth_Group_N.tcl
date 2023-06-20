proc dualVth {slackThreshold maxFanoutEndpointCost} {
    
    set cells [get_cells]
    set N [sizeof_collection $cells]
    foreach_in_collection cell $cells {
        set path [get_timing_paths -through $cell]
        set cell_slack [get_attribute $path slack]
        if {$cell_slack < $slackThreshold} {
            puts "[get_attribute $cell full_name]"
        }
    }
    return 1
}